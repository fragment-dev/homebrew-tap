require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2729.0.0-darwin-x64.tar.gz"
    sha256 "c85b447f58783bc96c9de96c49a6cabc0ac43943e3f8873df338f9ef174e31fd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2729.0.0-darwin-arm64.tar.gz"
      sha256 "d78049f627a2d71b1f636445b0b3845f99a57578634dd55f91d151dd685a2d5a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2729.0.0-linux-x64.tar.gz"
    sha256 "66d8466e1a087103168b9fa064ad7b5b21b3c1a8d6ec445aec6957cb35abf3cd"
  end
  version "2729.0.0"
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
