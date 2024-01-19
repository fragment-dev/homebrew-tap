require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4379.0.0-darwin-x64.tar.gz"
    sha256 "623654bff8d7d7e42901fb2589374ff2bc38d4980bf6f38d08fb51dc17b7336e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4379.0.0-darwin-arm64.tar.gz"
      sha256 "879dbe877cb55d2da3555937aa97a75c3dfd39d10b7da982e31122e14c0a790e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4379.0.0-linux-x64.tar.gz"
    sha256 "7bf20f6d7d1c70e214ad412f28030c6988edb828f83a9e35ba386c482ae8e92c"
  end
  version "4379.0.0"
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
