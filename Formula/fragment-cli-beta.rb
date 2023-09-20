require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3618.0.0-darwin-x64.tar.gz"
    sha256 "3c6176b7e4310eca154e5c420932d330c4ffe07b0b884785b29561ee2dd07ffa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3618.0.0-darwin-arm64.tar.gz"
      sha256 "eb8ce97690ea6b68a8b54677d21cbb1d822cfa123c25705acc9812675de5e6c4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3618.0.0-linux-x64.tar.gz"
    sha256 "f017522c8619b9715cf41784d3eab795eabf09d5c24fe273477adf208009072a"
  end
  version "3618.0.0"
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
