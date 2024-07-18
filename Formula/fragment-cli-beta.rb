require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5408.0.0-darwin-x64.tar.gz"
    sha256 "e7f6ac384f2cf574e212ee2bd0a9255f22d833849872b807d346ce0268e2efec"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5408.0.0-darwin-arm64.tar.gz"
      sha256 "e421c228357c9f1768de3d0fb799194eecdedb3a9b3639a6efadda6c755476fd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5408.0.0-linux-x64.tar.gz"
    sha256 "0e7efa1a1f02ae9fdbf859972dc0a366122c67d3a103a3a2cbe8c1277f8ce4a6"
  end
  version "5408.0.0"
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
