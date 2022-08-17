package laxe.ast;

import haxe.macro.Expr.Field;

@:nullSafety(Strict)
@:forward
@:remove
abstract LaxeField(Field) from Field to Field {
    public inline function new(f: Field) {
        this = f;
    }

    public function getExpr(): Null<LaxeExpr> {
        return switch(this.kind) {
            case FVar(_, e): e;
            case FFun({ expr: e }): e;
            case FProp(_, _, _, e): e;
        }
    }
}
