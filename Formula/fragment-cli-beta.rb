require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6068.0.0-darwin-x64.tar.gz"
    sha256 "60bf7efd17764b4ccb9280d0d8ccddb0c683c0120eb41912e9c012d41aa94c31"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6068.0.0-darwin-arm64.tar.gz"
      sha256 "b205eb354bdfda4d376cb8ca053ee8386cf5c4a8a5df4971c7c1ef9263df9ab4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6068.0.0-linux-x64.tar.gz"
    sha256 "d2e8f54fecbed3946499784bb788d55c4fe1bf4a687090bc3b1e37721f9913f6"
  end
  version "6068.0.0"
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
