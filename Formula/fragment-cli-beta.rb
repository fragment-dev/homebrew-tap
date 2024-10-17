require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5672.0.0-darwin-x64.tar.gz"
    sha256 "179052599db87dd6ffe36eae3cee586e7250b6bfe4562d928a72c60626a941ea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5672.0.0-darwin-arm64.tar.gz"
      sha256 "0d5f9640bc9534ca3c930bf611de1293ef7e87ab0e677ba27a68208911e6ca42"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5672.0.0-linux-x64.tar.gz"
    sha256 "bc5fcb1f1eaca1e5d1a4debc4596f7229f33078571b2e196c1c7e746544fe16a"
  end
  version "5672.0.0"
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
