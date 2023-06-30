require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2990.0.0-darwin-x64.tar.gz"
    sha256 "6bbb3261b883b25b302fcbeee63974b58dc251d36b76c1d587826a74a66a4bc5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2990.0.0-darwin-arm64.tar.gz"
      sha256 "854435542c7ec87f0f80f57d709aac4f0d3b5ccf2cf3822b26f584661c2b15a9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2990.0.0-linux-x64.tar.gz"
    sha256 "0d0144e11250c0485dc2df59a23f4086a38d3c9bf70a8b7253289907e34f090c"
  end
  version "2990.0.0"
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
