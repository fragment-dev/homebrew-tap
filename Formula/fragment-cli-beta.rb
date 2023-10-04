require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3760.0.0-darwin-x64.tar.gz"
    sha256 "c4103bab867dc538c69d49f93b72b1dd8e87457dcda1c72f681ea52a5a7bf52b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3760.0.0-darwin-arm64.tar.gz"
      sha256 "51aadc34c20c36136c7aa51771078f49e0c66e9b4143a7ceead7f018fd2bc8bf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3760.0.0-linux-x64.tar.gz"
    sha256 "324193b552b089cd9fdec761913223ae76f54a4fd813b49b5e643b10b1e78ea7"
  end
  version "3760.0.0"
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
