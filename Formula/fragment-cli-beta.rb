require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4326.0.0-darwin-x64.tar.gz"
    sha256 "37dc1bbff6083df35d9bfd54e1eb85734ebda00081bc0352ea7e45c7ffba0c7e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4326.0.0-darwin-arm64.tar.gz"
      sha256 "722db7e3c40e152099a579a2909d4547458a3ce025b2121eb2056e23d4a946fd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4326.0.0-linux-x64.tar.gz"
    sha256 "f38ad4d35d162f99eb753bde750b3b3283d056ba366c3d3c1061bbe1c5c49f40"
  end
  version "4326.0.0"
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
