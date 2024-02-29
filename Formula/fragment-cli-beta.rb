require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4675.0.0-darwin-x64.tar.gz"
    sha256 "141750ab5f471480b51899054efc0dd65552351e7af6fbe37f24e3b88479fbfa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4675.0.0-darwin-arm64.tar.gz"
      sha256 "384e3d5bdc83d00df8ee52c518797cbd400ab9963c113de455b38ba5816d5448"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4675.0.0-linux-x64.tar.gz"
    sha256 "7dc7eab372d3f4160baa5fa4832e96fc9028fcee6bca2c326487144e60590baf"
  end
  version "4675.0.0"
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
