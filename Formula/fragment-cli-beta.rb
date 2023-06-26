require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2933.0.0-darwin-x64.tar.gz"
    sha256 "e9b812d80862a8c6f6eb3f24c01efbeed163b13a9f060124a0230ccb1f6989f8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2933.0.0-darwin-arm64.tar.gz"
      sha256 "ff34540ae6a21070146d65e7129bfd87a62b354b56dac525d595354faa4ffd42"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2933.0.0-linux-x64.tar.gz"
    sha256 "c81d9eca449cbd108743135269274cf3b68d22fbf5ccfe7ff514f5a18e023377"
  end
  version "2933.0.0"
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
