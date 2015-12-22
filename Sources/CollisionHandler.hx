package;

class CollisionHandler {

  // checks if 2 entities collide, and if so 'hits' them both
  public static function handleBiCollision(h1: Hitboxed, h2: Hitboxed, ?callback: Void->Void = null): Void {
    if (testCollision(h1, h2)) {
      h1.hit();
      h2.hit();
      if (callback != null) {
        callback();
      }
    }
  }

  // compare every entity from leftGroup with every entity in rightGroup
  public static function handleGroupCollisions(leftGroup: Array<Hitboxed>, rightGroup: Array<Hitboxed>, 
                                               ?callback: Void->Void = null): Void {
    for (left in leftGroup) {
      for (right in rightGroup) {
        handleBiCollision(left, right, callback);
      }
    }
  }

  public static function testCollision(h1: Hitboxed, h2: Hitboxed): Bool {
    return h1.hitbox.overlaps(h2.hitbox);
  }
}