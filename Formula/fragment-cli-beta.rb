require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4923.0.0-darwin-x64.tar.gz"
    sha256 "a31da73c721fc418c9a01c9ab0d6545c9616467cfbd039cfdae9d6f77b9fd301"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4923.0.0-darwin-arm64.tar.gz"
      sha256 "3cd25d3c37e45f4fea23b8f2a5b169c251822240873aa1cc96ebb8ffde5be45b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4923.0.0-linux-x64.tar.gz"
    sha256 "0e6f2e797e2636da9b92a9d2c1440979055beca00384c2409ba1509e002256be"
  end
  version "4923.0.0"
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
