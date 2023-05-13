require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2659.0.0-darwin-x64.tar.gz"
    sha256 "21ebcc4350f234195849784af46ad033bdea24a58211f4c8e6c34d558bd408f8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2659.0.0-darwin-arm64.tar.gz"
      sha256 "b06232a96a5820c97620f70b53daded99931b7b6cfe432a0f5b1e2ac5a9a44a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2659.0.0-linux-x64.tar.gz"
    sha256 "b67156632b099b3cdd1886435b0d468097582c0aa34f23c8fdc6cce4f6ddc004"
  end
  version "2659.0.0"
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
