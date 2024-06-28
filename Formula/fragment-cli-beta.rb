require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5327.0.0-darwin-x64.tar.gz"
    sha256 "9ce9fa42d3e31f1e07112add78a3194bf90861021ab15570901c01d9d747d0a3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5327.0.0-darwin-arm64.tar.gz"
      sha256 "7b5d0cf4fb00adab6881689916446f7cbbf29542dba42796800cd37012882caf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5327.0.0-linux-x64.tar.gz"
    sha256 "f7ff23f72f00037172ec164a4e08d9d36bbc239207ff1d7ecd94b90741e4ae5c"
  end
  version "5327.0.0"
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
