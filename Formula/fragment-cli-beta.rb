require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4178.0.0-darwin-x64.tar.gz"
    sha256 "62d48e7566e84d76776bc1ad4e26dd12003b0025e444cf5e03262bb8272f58ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4178.0.0-darwin-arm64.tar.gz"
      sha256 "8f451a315765ce437760f4a2c9e31feb96e8d484a1244b0750d827504158dce7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4178.0.0-linux-x64.tar.gz"
    sha256 "3e52538ea14417f1c8b1fcd69535d370b31a279fcf83118acf8c7e93dbd5309a"
  end
  version "4178.0.0"
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
