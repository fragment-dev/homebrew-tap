require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4464.0.0-darwin-x64.tar.gz"
    sha256 "da0d8a2ec1ea90eb91dcd3d7b16eeaac2a1ce0668e9f1deb4cc201ff5962e1ff"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4464.0.0-darwin-arm64.tar.gz"
      sha256 "ad39ac1a9cb2a346bc8ae244df7d36539e14d8986b75435754feb55a784a1597"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4464.0.0-linux-x64.tar.gz"
    sha256 "725098b4f6c2e5716714297a5a21e3f130f90a1c17e33fce10a58d774706f5f4"
  end
  version "4464.0.0"
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
