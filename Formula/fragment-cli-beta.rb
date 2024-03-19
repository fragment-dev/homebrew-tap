require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4788.0.0-darwin-x64.tar.gz"
    sha256 "2bae60e89b4ae73eda8fffc918303dc16edfabc739c64c174f0020cd49a90962"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4788.0.0-darwin-arm64.tar.gz"
      sha256 "6c87969288a5c78f936b923150a72f872584584548c91e6ec5410e323e6f79e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4788.0.0-linux-x64.tar.gz"
    sha256 "e08b8f0e67345f2533f3d8461380c900b6afb9f8fe3bd9478621a5085c7152fd"
  end
  version "4788.0.0"
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
