require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2902.0.0-darwin-x64.tar.gz"
    sha256 "78696adda52238dec7f8436c5c5f2c47d0a02a59ec5e845a1ef120b5e2f495cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2902.0.0-darwin-arm64.tar.gz"
      sha256 "019abdc9c10f886784f8b4a30527f7420d2b7f360ad320fc8de42fe00c666b1c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2902.0.0-linux-x64.tar.gz"
    sha256 "8a05b7456754c76befbc0ad73ca92764306b53083aa221009a9dba2ac0000bcb"
  end
  version "2902.0.0"
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
