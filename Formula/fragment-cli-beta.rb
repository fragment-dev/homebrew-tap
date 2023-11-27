require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4049.0.0-darwin-x64.tar.gz"
    sha256 "dcabc3fcd53f47fee4384e9c93f17079664bccac5a50cd2ea67f964716636769"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4049.0.0-darwin-arm64.tar.gz"
      sha256 "d78b9b00fb2255757c30d93461e20f5813ff11568861848e62bb0f6be90fa45c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4049.0.0-linux-x64.tar.gz"
    sha256 "a916b54f161aeddc121cb37baabdef4110c60e176a893634a5d8cfc0205668ca"
  end
  version "4049.0.0"
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
