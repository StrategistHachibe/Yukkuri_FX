
-- 外部関数：拡張アニメーション
function ExAnimation()

	-- 関数：定期型アニメーションの末尾文字を決定
	function TeikiAnimation(Bangou,Moji,Parts,Type,Kaishi,Kankaku,Jikan,Chukan)

		Matsubi = "" -- 末尾を初期化

		-- 浮遊と同期指定で、浮遊してない場合は、アニメーションなし
		if Jikan == 0 or Kankaku == 0 then
			if BaseFuyuudo <= 0 then return Matsubi end 
		end

		-- マークかそれ以外化によってフォルダパスを場合分け
		if Parts == "マーク" then
			FolderPass = CHARA_SOZAI.."小道具\\マーク\\"
		else
			FolderPass = CHARA_SOZAI..CharaFolder..CN.."\\"..Parts.."\\"
		end

		-- 前後判別文字の決定
		Zengo = ""
		FilePass = FolderPass..string.format("%02d",Bangou)..Moji.."01.png"
		if os.rename(FilePass,FilePass) == nil then
			for Count = 1,9 do
				FilePass = FolderPass..string.format("%02d",Bangou).."m"..Count..Moji.."01.png"
				if os.rename(FilePass,FilePass) ~= nil then
					Zengo = "m"..Count
					break
				end
				FilePass = FolderPass..string.format("%02d",Bangou).."u"..Count..Moji.."01.png"
				if os.rename(FilePass,FilePass) ~= nil then
					Zengo = "u"..Count
					break
				end
			end
		end

		-- 分割数を決定
		BunkatsuSuu = 0
		while 1 do
			FilePass = FolderPass..string.format("%02d",Bangou)..Zengo..Moji..string.format("%02d",BunkatsuSuu+1)..".png"
			if os.rename(FilePass,FilePass) == nil then break end
			BunkatsuSuu = BunkatsuSuu + 1
		end

		if BunkatsuSuu > 0 then

			if Type == "往復" then

				if Parts == "マーク" then

					-- 分割時間を設定
					BunkatsuTime = Jikan/(2*BunkatsuSuu+Chukan)

					-- 余り時間を設定
					AmariTime = ObjTime % Kankaku

				elseif Jikan == 0 or Kankaku == 0 then

					-- 分割時間を設定
					BunkatsuTime = BaseFS/(2*BunkatsuSuu+Chukan)

					-- 余り時間を設定
					AmariTime = (ObjTime + BaseFuyuuStart) % BaseFS

				else

					-- 分割時間を設定
					BunkatsuTime = Jikan/(2*BunkatsuSuu+Chukan)

					-- 余り時間を設定
					KaishiTime = (Kankaku * (BaseMS % BaseMK) / BaseMK + Kaishi + Kankaku) % Kankaku
					AmariTime = ObjTime % Kankaku - KaishiTime
				end

				-- 余り時間から、体画像を決定
				Count = 1
				while (Count-1)*BunkatsuTime <= AmariTime and Count <= (2*BunkatsuSuu+Chukan) + 1 do
					if Count <= BunkatsuSuu then
						Matsubi = Moji..string.format("%02d",Count)
					elseif Count <= BunkatsuSuu + Chukan then
						Matsubi = Moji..string.format("%02d",BunkatsuSuu)
					elseif Count <= 2*BunkatsuSuu + Chukan then
						Matsubi = Moji..string.format("%02d",(2*BunkatsuSuu+Chukan)-Count+1)
					else
						Matsubi = ""
					end
					Count = Count + 1
				end

			elseif Type == "片道" then

				if Parts == "マーク" then

					-- 分割時間を設定
					BunkatsuTime = Jikan/(2*BunkatsuSuu+Chukan)

					-- 余り時間を設定
					AmariTime = ObjTime % Kankaku

				elseif Jikan == 0 or Kankaku == 0 then

					-- 分割時間を設定
					BunkatsuTime = BaseFS/BunkatsuSuu

					-- 余り時間を設定
					AmariTime = (ObjTime + BaseFuyuuStart) % BaseFS

				else

					-- 分割時間を設定
					BunkatsuTime = Jikan/BunkatsuSuu

					-- 余り時間を設定
					KaishiTime = (Kankaku * (BaseMS % BaseMK) / BaseMK + Kaishi + Kankaku) % Kankaku
					AmariTime = ObjTime % Kankaku - KaishiTime

				end

				-- 余り時間から、画像を決定
				Count = 1
				while (Count-1)*BunkatsuTime <= AmariTime and Count <= BunkatsuSuu + 1 do
					if Count <= BunkatsuSuu then
						Matsubi = Moji..string.format("%02d",Count)
					else
						Matsubi = ""
					end
					Count = Count + 1
				end

			end

		end

		return Matsubi -- 末尾を返す

	end

	-- 拡張アニメーション用文字列の初期化
	KaoString = ""
	MayuString = ""
	KaradaString = ""
	HokaString = ""
	AryMaeKumiString = {"","","","","","","","","",""}
	AryUshiroKumiString = {"","","","","","","","","",""}
	MarkString = ""

	----------------------------------------------------------------------
	-- 拡張アニメーション（キャラオブジェクト専用）
	----------------------------------------------------------------------

	if CharaObjectFlag == 1 then 

		【拡張アニメーション】

	end

	----------------------------------------------------------------------
	-- マークの拡張アニメーション（キャラオブジェクト以外も可）
	----------------------------------------------------------------------

	【拡張アニメーション（マーク）】

end
