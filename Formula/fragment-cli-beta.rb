require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4234.0.0-darwin-x64.tar.gz"
    sha256 "56e00b8ae643393403a9e98fd99d0f9e6abea132110a19c38068b74867ac6e89"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4234.0.0-darwin-arm64.tar.gz"
      sha256 "7f5e7e27d2fdc0c053d5a32341d7d70240bf9aec30f3821056dbd041ee5ce7bb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4234.0.0-linux-x64.tar.gz"
    sha256 "4322ce0c4fc5ee02899f001075ee4f0c513bf2276303afe61d39348fc2337e19"
  end
  version "4234.0.0"
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
