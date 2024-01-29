require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4451.0.0-darwin-x64.tar.gz"
    sha256 "503e2bf8e54a2582115e830f9cc11d653a90d6aa5bc06380a50df957bcccb5d0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4451.0.0-darwin-arm64.tar.gz"
      sha256 "c2f162782034a76e3bb4745ca2db76ed47434b02d3208ac447ff43cde6afddca"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4451.0.0-linux-x64.tar.gz"
    sha256 "c34f4f1d258f8733c1697fd2359f18c24f01ffd60849afafaabfaf8306aa3876"
  end
  version "4451.0.0"
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
