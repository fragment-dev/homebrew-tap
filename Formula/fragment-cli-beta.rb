require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3750.0.0-darwin-x64.tar.gz"
    sha256 "5223f8577e10270e123e1c17ae55ba5345142cc96615a390636875e3137f3abf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3750.0.0-darwin-arm64.tar.gz"
      sha256 "1ef6355703e7079e0a66e1e5d13704f87b46310021a136c389a6f7cecb06f306"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3750.0.0-linux-x64.tar.gz"
    sha256 "cdb1a1648283025e858e944d90a2b45c49056540925f6a665af954aa74419a97"
  end
  version "3750.0.0"
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
