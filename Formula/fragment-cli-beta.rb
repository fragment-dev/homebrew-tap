require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2602.0.0-darwin-x64.tar.gz"
    sha256 "ca8eabcef643755be2e02b4a6985df60ce5c99420cf307f8e93e865e9e79c3b9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2602.0.0-darwin-arm64.tar.gz"
      sha256 "99272d3d1e0d16ce7ac40d5e898ac33bfd3817faa04a01e01ab2ac46706e733b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2602.0.0-linux-x64.tar.gz"
    sha256 "b685425e94db163fab0f49845255ebb65b5ca100d32d9d083b9aa551bc3d1241"
  end
  version "2602.0.0"
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
