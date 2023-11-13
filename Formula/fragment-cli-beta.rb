require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3997.0.0-darwin-x64.tar.gz"
    sha256 "33350c795a5d2012f4f6b86609d515f52f0ad274268dc3bfea5398a20c5b8c17"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3997.0.0-darwin-arm64.tar.gz"
      sha256 "4e751a3140713566346e4428b2887fd2ceec26ddb18bb4b3aae9f7c33a8ae03b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3997.0.0-linux-x64.tar.gz"
    sha256 "12a882a1888a5e6ac254afd7ee697a515e20c25fb4e4b4974d0995a45f354086"
  end
  version "3997.0.0"
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
