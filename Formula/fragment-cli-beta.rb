require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3231.0.0-darwin-x64.tar.gz"
    sha256 "003771343a7d9488c1dd644f8075be2ae2355c335e9bf120e1789c0cc19da69b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3231.0.0-darwin-arm64.tar.gz"
      sha256 "053548d4e9ee4dfb17165057f39c81721fd2246980f4365ba0f0749d824f39f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3231.0.0-linux-x64.tar.gz"
    sha256 "5260e97b302ca0521b15a02c5af1f573168d74cf8a48ac7cc578d254da2db9c6"
  end
  version "3231.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
