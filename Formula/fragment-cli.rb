require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-2-darwin-x64.tar.gz"
    sha256 "72c3bd19fccea313271469679d781f77a77a9f6fcede811fe744d68300c2efbf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-2-darwin-arm64.tar.gz"
      sha256 "cec18c0b49f9fa184d55e2f83ac630ba29b72c6eb6750b1aa74113f33c74df3d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.15-2-linux-x64.tar.gz"
    sha256 "0c43b78b12cb62cfe30537426d1c71a8e40cf46d7417224e39c52f8d43c0a6f9"
  end
  version "2024.4.15-2"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
