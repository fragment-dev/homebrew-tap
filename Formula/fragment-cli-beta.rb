require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3018.0.0-darwin-x64.tar.gz"
    sha256 "763df671f3de8e1ba3a2d97cf3ff86eec518be16af1553972d06301e855b2c36"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3018.0.0-darwin-arm64.tar.gz"
      sha256 "26798e299dddeade14d9606eee8101288d0c26b3f3f6ab93b2bfd4ef82f8595b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3018.0.0-linux-x64.tar.gz"
    sha256 "3437fe8e03fe2f354efd6ecf6dd2ab64b9825a55b5586154293d83ce736ca918"
  end
  version "3018.0.0"
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
