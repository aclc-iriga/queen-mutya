<?php

require_once 'App.php';

class Duo extends App
{
    // table
    protected $table = 'duos';

    // properties
    protected $id;
    protected $slug;
    protected $title;
    protected $event_id_1;
    protected $event_id_2;


    /***************************************************************************
     * Duo constructor
     *
     * @param int $id
     */
    public function __construct($id = 0)
    {
        parent::__construct();

        // get other info
        if($id > 0) {
            $stmt = $this->conn->prepare("SELECT * FROM $this->table WHERE id = ?");
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $result = $stmt->get_result();
            if($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                $this->id = $row['id'];
                $this->slug  = $row['slug'];
                $this->title = $row['title'];
                $this->event_id_1 = $row['event_id_1'];
                $this->event_id_2 = $row['event_id_2'];
            }
        }
    }


    /***************************************************************************
     * Execute find
     *
     * @param $stmt
     * @return Duo|false
     */
    private static function executeFind($stmt)
    {
        $stmt->execute();
        $result = $stmt->get_result();
        if($row = $result->fetch_assoc())
            return new Duo($row['id']);
        else
            return false;
    }


    /***************************************************************************
     * Find duo by id
     *
     * @param int $id
     * @return Duo|boolean
     */
    public static function findById($id)
    {
        $duo = new Duo();
        $stmt = $duo->conn->prepare("SELECT id FROM $duo->table WHERE id = ?");
        $stmt->bind_param("i", $id);
        return self::executeFind($stmt);
    }


    /***************************************************************************
     * Find duo by slug
     *
     * @param string $slug
     * @return Duo|boolean
     */
    public static function findBySlug($slug)
    {
        $duo = new Duo();
        $stmt = $duo->conn->prepare("SELECT id FROM $duo->table WHERE slug = ?");
        $stmt->bind_param("s", $slug);
        return self::executeFind($stmt);
    }


    /***************************************************************************
     * Convert duo object to array
     *
     * @return array
     */
    public function toArray()
    {
        return [
            'id'    => $this->id,
            'slug'  => $this->slug,
            'title' => $this->title,
            'event_id_1' => $this->event_id_1,
            'event_id_2' => $this->event_id_2
        ];
    }


    /***************************************************************************
     * Get all duos as array of objects
     *
     * @return Duo[]
     */
    public static function all()
    {
        $duo = new Duo();
        $sql = "SELECT id FROM $duo->table ORDER BY id";
        $stmt = $duo->conn->prepare($sql);
        $stmt->execute();

        $result = $stmt->get_result();
        $duos = [];
        while($row = $result->fetch_assoc()) {
            $duos[] = new Duo($row['id']);
        }
        return $duos;
    }


    /***************************************************************************
     * Get all duos as array of arrays
     *
     * @return array
     */
    public static function rows()
    {
        $duos = [];
        foreach(self::all() as $duo) {
            $duos[] = $duo->toArray();
        }
        return $duos;
    }


    /***************************************************************************
     * Check if duo id exists
     *
     * @param $id
     * @return bool
     */
    public static function exists($id)
    {
        if(!$id)
            return false;

        return (self::findById($id) != false);
    }


    /***************************************************************************
     * Check if duo slug exists
     *
     * @param string $slug
     * @param int $id
     * @return bool
     */
    public static function slugExists($slug, $id = 0)
    {
        $duo = new Duo();
        $stmt = $duo->conn->prepare("SELECT id FROM $duo->table WHERE slug = ? AND id != ?");
        $stmt->bind_param("si", $slug, $id);
        $stmt->execute();
        $result = $stmt->get_result();
        return ($result->num_rows > 0);
    }


    /***************************************************************************
     * Insert duo
     *
     * @return void
     */
    public function insert()
    {
        // check id
        if(self::exists($this->id))
            App::returnError('HTTP/1.1 409', 'Insert Error: duo [id = ' . $this->id . '] already exists.');

        // check event_id
        require_once 'Event.php';
        if(!Event::exists($this->event_id_1))
            App::returnError('HTTP/1.1 404', 'Insert Error: event [id = ' . $this->event_id_1 . '] does not exist.');
        if(!Event::exists($this->event_id_2))
            App::returnError('HTTP/1.1 404', 'Insert Error: event [id = ' . $this->event_id_2 . '] does not exist.');

        // check slug
        if(self::slugExists($this->slug))
            App::returnError('HTTP/1.1 409', 'Insert Error: duo [slug = ' . $this->slug . '] already exists.');

        // proceed with insert
        $stmt = $this->conn->prepare("INSERT INTO $this->table(slug, title, event_id_1, event_id_2) VALUES(?, ?, ?, ?)");
        $stmt->bind_param("ssii", $this->slug, $this->title, $this->event_id_1, $this->event_id_2);
        $stmt->execute();
        $this->id = $this->conn->insert_id;
    }


    /***************************************************************************
     * Update duo
     *
     * @return void
     */
    public function update()
    {
        // check id
        if(!self::exists($this->id))
            App::returnError('HTTP/1.1 404', 'Update Error: duo [id = ' . $this->id . '] does not exist.');

        // check event_id
        require_once 'Event.php';
        if(!Event::exists($this->event_id_1))
            App::returnError('HTTP/1.1 404', 'Update Error: event [id = ' . $this->event_id_1 . '] does not exist.');
        if(!Event::exists($this->event_id_2))
            App::returnError('HTTP/1.1 404', 'Update Error: event [id = ' . $this->event_id_2 . '] does not exist.');

        // check slug
        if(self::slugExists($this->slug, $this->id))
            App::returnError('HTTP/1.1 409', 'Update Error: duo [slug = ' . $this->slug . '] already exists.');

        // proceed with update
        $stmt = $this->conn->prepare("UPDATE $this->table SET slug = ?, title = ?, event_id_1 = ?, event_id_2 = ? WHERE id = ?");
        $stmt->bind_param("ssiii", $this->slug, $this->title, $this->event_id_1, $this->event_id_2, $this->id);
        $stmt->execute();
    }


    /***************************************************************************
     * Delete duo
     *
     * @return void
     */
    public function delete()
    {
        // check id
        if(!self::exists($this->id))
            App::returnError('HTTP/1.1 404', 'Delete Error: duo [id = ' . $this->id . '] does not exist.');

        // proceed with delete
        $stmt = $this->conn->prepare("DELETE FROM $this->table WHERE id = ?");
        $stmt->bind_param("i", $this->id);
        $stmt->execute();
    }


    /***************************************************************************
     * Set slug
     *
     * @param string $slug
     * @return void
     */
    public function setSlug($slug)
    {
        $this->slug = parent::generateSlug($slug);
    }


    /***************************************************************************
     * Set title
     *
     * @param string $title
     * @return void
     */
    public function setTitle($title)
    {
        $this->title = $title;
    }


    /***************************************************************************
     * Set event_id_1
     *
     * @param int $event_id
     * @return void
     */
    public function setEventId1($event_id)
    {
        $this->event_id_1 = $event_id;
    }


    /***************************************************************************
     * Set event_id_2
     *
     * @param int $event_id
     * @return void
     */
    public function setEventId2($event_id)
    {
        $this->event_id_2 = $event_id;
    }


    /***************************************************************************
     * Get slug
     *
     * @return string
     */
    public function getSlug()
    {
        return $this->slug;
    }


    /***************************************************************************
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }


    /***************************************************************************
     * Get event_id_1
     *
     * @return int
     */
    public function getEventId1()
    {
        return $this->event_id_1;
    }


    /***************************************************************************
     * Get event_id_2
     *
     * @return int
     */
    public function getEventId2()
    {
        return $this->event_id_2;
    }


    /***************************************************************************
     * Get event 1
     *
     * @return Event
     */
    public function getEvent1()
    {
        require_once 'Event.php';
        return new Event($this->event_id_1);
    }


    /***************************************************************************
     * Get event 2
     *
     * @return Event
     */
    public function getEvent2()
    {
        require_once 'Event.php';
        return new Event($this->event_id_2);
    }
}