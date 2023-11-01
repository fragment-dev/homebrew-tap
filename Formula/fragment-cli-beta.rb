require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3961.0.0-darwin-x64.tar.gz"
    sha256 "bde6ef9e5d04a30d4279ff7e4182855230f399f61a42833e69c931e8bf64c265"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3961.0.0-darwin-arm64.tar.gz"
      sha256 "a987af10ea49603c9fd8b73f54eff675286d65ee72ea252c9ea9ae014e868e4d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3961.0.0-linux-x64.tar.gz"
    sha256 "ef455f4d42300788ad0f46e1de808949739d1fa6d58429aefb60655016e1f5ee"
  end
  version "3961.0.0"
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
