require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3072.0.0-darwin-x64.tar.gz"
    sha256 "216f3ef20c86280e1d17acd18b8dbedcaa07a7990c7d9b46509e5a2a1ea34eef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3072.0.0-darwin-arm64.tar.gz"
      sha256 "cf695b8f5d42140073aff459f0c2617d1e8af823b100bab3a9542ac37a31b595"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3072.0.0-linux-x64.tar.gz"
    sha256 "632232a04a58904c98f91b4831273fedc8a8598eb0a8d73827f63985cd7b956c"
  end
  version "3072.0.0"
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
