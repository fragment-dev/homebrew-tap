require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4146.0.0-darwin-x64.tar.gz"
    sha256 "0504b51fe590582aa73e138487d0c03025f0f53ac226a61577033c90f65034eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4146.0.0-darwin-arm64.tar.gz"
      sha256 "51752f174c5f47157f84927818a7ff2c1b25438b6a5dfa17894f078774dda1e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4146.0.0-linux-x64.tar.gz"
    sha256 "4aaaa88b7d7a57824e3f1b807f2539b42a90cce624c7c44f4c4746678c350eb2"
  end
  version "4146.0.0"
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
