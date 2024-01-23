require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4398.0.0-darwin-x64.tar.gz"
    sha256 "eac2d862d764c04a347a11c86bbde01921ec0f27e3647d882f667ddd2745b2fa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4398.0.0-darwin-arm64.tar.gz"
      sha256 "d827bacd97e9fda9293fbec2a830084ad254ce06f9ddffcf465aca73f3146800"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4398.0.0-linux-x64.tar.gz"
    sha256 "58f5b501a9a4fae6adc7a955468022b92c784ca946d65b15d07cd7555d973aff"
  end
  version "4398.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
