require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4917.0.0-darwin-x64.tar.gz"
    sha256 "1412f30ed61c1365b1a4b644f8b9eb33797dde05c1159f76559f1bd0c7581fb1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4917.0.0-darwin-arm64.tar.gz"
      sha256 "d07b2e256a62006217781eca72a0719f6ff8f0b2fd6a70e7eb0607fbdec6587e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4917.0.0-linux-x64.tar.gz"
    sha256 "cd09d97a05c1e144e43687c0877fca4e2be84c93ede4dd2565090a5129d7c6fd"
  end
  version "4917.0.0"
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
