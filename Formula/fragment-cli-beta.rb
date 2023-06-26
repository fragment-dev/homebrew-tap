require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2928.0.0-darwin-x64.tar.gz"
    sha256 "986f4b93557b7d165fa5d745cac43b631103a54d032e5b2ae2ae5e82627b24d8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2928.0.0-darwin-arm64.tar.gz"
      sha256 "7e2869f6ae5977b4082e6e5367f66f771686fe90a9d8046c598249f09b45a1ad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2928.0.0-linux-x64.tar.gz"
    sha256 "a84017d707ea90638ca21f28e1cd6ce3bda0677b6f0392e498e2320940c0f6ca"
  end
  version "2928.0.0"
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
