require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2758.0.0-darwin-x64.tar.gz"
    sha256 "3c8c9143ab70229cf4795050c75a5892f10a9ff22abda4e2125ab2bb303e2ffb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2758.0.0-darwin-arm64.tar.gz"
      sha256 "a0e604396401eb078983e5e1f0f7e1b949b28f164023c4569883312389f56e1c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2758.0.0-linux-x64.tar.gz"
    sha256 "dfd381b897338409c898a5719624fed9151d78935cb913d4aa3f22f593b3944c"
  end
  version "2758.0.0"
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
