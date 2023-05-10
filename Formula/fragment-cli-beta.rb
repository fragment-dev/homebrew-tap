require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2616.0.0-darwin-x64.tar.gz"
    sha256 "518e519f282c324557030e1f94feba40f470e7ef0cf2008588a46861732e23e2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2616.0.0-darwin-arm64.tar.gz"
      sha256 "3a2545f3cf1ee11eb66476c08cd80f103faaf66de92ffd64196a82923bdf3381"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2616.0.0-linux-x64.tar.gz"
    sha256 "5d0bda697069bd4381772953c5891acbe0d50dc74a7ce36ec94e33dd131e46df"
  end
  version "2616.0.0"
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
