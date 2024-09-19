require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5607.0.0-darwin-x64.tar.gz"
    sha256 "61087a932eb787f169e19380c3cdff9b91469559dc186674c3f5dcefcf89bf2d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5607.0.0-darwin-arm64.tar.gz"
      sha256 "b6e1cb587289a6f5673ef4015b2efc6b0e7b9811676f1ca2e6d514c695ee2fa1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5607.0.0-linux-x64.tar.gz"
    sha256 "e1d97813c31516096cb590d77fe92ac94aac25e445126ebed309a60204a72fe4"
  end
  version "5607.0.0"
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
