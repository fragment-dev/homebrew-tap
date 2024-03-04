require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4701.0.0-darwin-x64.tar.gz"
    sha256 "efa75e699b961f7f3a78bff75aa58becc34f901441dcc3bbbd095b75a1daa682"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4701.0.0-darwin-arm64.tar.gz"
      sha256 "08f0724c487652fa35f454ffc82101b8c158caa77983276a73b531dfed76fece"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4701.0.0-linux-x64.tar.gz"
    sha256 "5c66a80dc8445339f78f3f821ba0d2e00637315bc31686557742b95c16c0eb5b"
  end
  version "4701.0.0"
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
