require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4286.0.0-darwin-x64.tar.gz"
    sha256 "4089f933ba3d3624f1729d079bcfa1e6cf0bdeca5cd83992249fd204db3d1765"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4286.0.0-darwin-arm64.tar.gz"
      sha256 "690d3452c80b6f60e966240ea01058652a28c36e954bdd66c5d2d0c525abbfd5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4286.0.0-linux-x64.tar.gz"
    sha256 "f046a8d348fe30180c8bb61e0b1604e72859270e8d1bf0e2f808f243d3f90f07"
  end
  version "4286.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
