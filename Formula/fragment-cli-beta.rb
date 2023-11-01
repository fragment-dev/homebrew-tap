require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3956.0.0-darwin-x64.tar.gz"
    sha256 "eaa52cf920f04921b269dded764e0d8c059f13ccd661d16a21ae01268f0f429b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3956.0.0-darwin-arm64.tar.gz"
      sha256 "26b86a7465cba74a00a28390724fd280c375d6cf24dc9d702209857df3e1962c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3956.0.0-linux-x64.tar.gz"
    sha256 "27252bc24200a95c756756306bf160ad4f43bc75da81744cbf583d18e8400224"
  end
  version "3956.0.0"
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
