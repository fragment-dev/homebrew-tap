require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2955.0.0-darwin-x64.tar.gz"
    sha256 "1593e21fcaaf2964fa43fa0449024b355d2783b2b02ed81efe16f53118b1469c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2955.0.0-darwin-arm64.tar.gz"
      sha256 "64c21214d2a8910d92252cd76f61f662e9cb380231a1bb320f27dfa5e9b5b9d6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2955.0.0-linux-x64.tar.gz"
    sha256 "4d4a82b27dc55f7c9c5a2de81d69e28ac5a5668f6ef3b5c889205eafb8b1481b"
  end
  version "2955.0.0"
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
