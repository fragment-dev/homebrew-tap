require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2745.0.0-darwin-x64.tar.gz"
    sha256 "472934765429fc35c3dfcbf346b7824ce6bd1f4477fd8c6515899ce375e8297a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2745.0.0-darwin-arm64.tar.gz"
      sha256 "c92a7bd6417a5e10dd761e1c4b31ca33ea682abffb9af3f27e3fa1b559648dda"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2745.0.0-linux-x64.tar.gz"
    sha256 "dbada234965168c8b68f84d6027e9d58514291e39e0b0ba2cad9a5fbdee81fcd"
  end
  version "2745.0.0"
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
