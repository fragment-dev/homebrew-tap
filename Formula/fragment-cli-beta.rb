require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3723.0.0-darwin-x64.tar.gz"
    sha256 "0bf70e6160d695dc20707c0a11ec792711823c9cbf56a301212f39cfb2b0c89b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3723.0.0-darwin-arm64.tar.gz"
      sha256 "35e71618fe6c54f6742b2e3d7a5cbd252e9005d18a8ce88917aa5ef6caf9c5a0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3723.0.0-linux-x64.tar.gz"
    sha256 "f0dc6374258261d33d83f617954be47edbfe975de1286df7675f189cff236b8a"
  end
  version "3723.0.0"
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
