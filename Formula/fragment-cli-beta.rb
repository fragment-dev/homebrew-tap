require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4563.0.0-darwin-x64.tar.gz"
    sha256 "96233dfed82d3e49e9614dbf3698ec647d2dc5e1f9d459e282e6022264b54232"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4563.0.0-darwin-arm64.tar.gz"
      sha256 "c9aed5dbcbdf46f7fc8ded07c6f06d7ee83814f561943a7ed9539063c2791ff0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4563.0.0-linux-x64.tar.gz"
    sha256 "dad2fc9ae222364b9fb1c5f10b6a604d4de378306a8c67a8e9cf83c7ba631c75"
  end
  version "4563.0.0"
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
