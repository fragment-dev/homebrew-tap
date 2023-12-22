require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4197.0.0-darwin-x64.tar.gz"
    sha256 "e6ba97974248e5c59968b429418fc922f952398090a81eabc1e474251fd58b23"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4197.0.0-darwin-arm64.tar.gz"
      sha256 "0d3dea835cef0dbae082a08b5239af07118456f3d4100fdab8c633727834fc1a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4197.0.0-linux-x64.tar.gz"
    sha256 "bc94dcf6ded4bcebe5c130f2233bb93ae35de991ccaad49ce73ef6e1f45e17bb"
  end
  version "4197.0.0"
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
