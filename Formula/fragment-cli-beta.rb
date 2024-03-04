require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4691.0.0-darwin-x64.tar.gz"
    sha256 "2378da463f731c29f5a78e5eed549f155fa21a7c21a84ac689a5bd9141332a87"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4691.0.0-darwin-arm64.tar.gz"
      sha256 "49976be03fe6cef640f0990f6d8b5675ece1c1e58f97a0663d0bd13f16a71d06"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4691.0.0-linux-x64.tar.gz"
    sha256 "2e8904bc87104805609799794a7620a0a2b6512cea61dca0502ac7679f3eb633"
  end
  version "4691.0.0"
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
