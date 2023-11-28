require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4054.0.0-darwin-x64.tar.gz"
    sha256 "6cf77b7f52ec0fa0f5c2f187ecf7f44b188424acab879cee7fec2fca2093eed1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4054.0.0-darwin-arm64.tar.gz"
      sha256 "f2937c7066a3b5bbde3773074d8b36360656d87740053dfed45f4d6335fa4ed3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4054.0.0-linux-x64.tar.gz"
    sha256 "00d433ec6e96147facb9c2d15a7f0ab0600b707a4d93ee1f5d7218f0bba287b3"
  end
  version "4054.0.0"
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
