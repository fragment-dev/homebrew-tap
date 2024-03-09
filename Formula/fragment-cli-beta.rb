require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4741.0.0-darwin-x64.tar.gz"
    sha256 "2b7a6561bdc356c8c945a8bcb40e3c4c172cce8e124e41276fe92dc5bd9b682b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4741.0.0-darwin-arm64.tar.gz"
      sha256 "b0040f5994ba5abe1f15b365d579602cbe8888edbb3d3bada937fea1225cc499"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4741.0.0-linux-x64.tar.gz"
    sha256 "962c052335f2ebffcf6f20ca2ab805d582fad0940cb71577c15efbd91ccc93c8"
  end
  version "4741.0.0"
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
