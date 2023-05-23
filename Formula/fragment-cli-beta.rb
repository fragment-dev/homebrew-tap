require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2719.0.0-darwin-x64.tar.gz"
    sha256 "2825606e435c39861e219c218f3c44adc46c70bd0a2db92769f82dafef393ba3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2719.0.0-darwin-arm64.tar.gz"
      sha256 "63c1d3b9e8edece6b574633dadc71b9b209bd5063d68c09c63757a506a140b2b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2719.0.0-linux-x64.tar.gz"
    sha256 "b7a543754000e080a33706e1f5bb582844480953e7ccf7468ce4339eb01ae5d4"
  end
  version "2719.0.0"
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
