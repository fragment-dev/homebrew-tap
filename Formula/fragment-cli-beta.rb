require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3811.0.0-darwin-x64.tar.gz"
    sha256 "500eac08455d63a381302b63d15f1cc8acce82fb339f79d4ce56eb50998a31b7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3811.0.0-darwin-arm64.tar.gz"
      sha256 "bf46d0061e781db890feb44045e697ebabd1f82a06adac180a113cc711938a8a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3811.0.0-linux-x64.tar.gz"
    sha256 "07b030472c39f2bb0dbd1f0057ee5e2385878c4951e27cd66c5bddac15cbd3e0"
  end
  version "3811.0.0"
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
