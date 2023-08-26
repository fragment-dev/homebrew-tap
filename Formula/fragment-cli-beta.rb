require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3397.0.0-darwin-x64.tar.gz"
    sha256 "f4cc0ffe902062477e2a2b261dcd53fbf0ef334e3863eddb8974614fa9f9ea16"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3397.0.0-darwin-arm64.tar.gz"
      sha256 "ab04cf73498740a95d85f061f6dce87a1390e85ab6739ac69f8e0f7b381f725b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3397.0.0-linux-x64.tar.gz"
    sha256 "737d9e5e8b42838eab215cdd56264fe217f0739e4a4250e485c5d2b0d372eb70"
  end
  version "3397.0.0"
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
