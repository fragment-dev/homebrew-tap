require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.5-darwin-x64.tar.gz"
    sha256 "1bd8d9ec465502cd4857dc4834b03a51a9b27c79ff0602735080e2f45216a9b2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.5-darwin-arm64.tar.gz"
      sha256 "bc9a3f3c437e7cef8b91865c841e713591d12de5a4144d6983d48e8286fcf09d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.5-linux-x64.tar.gz"
    sha256 "cc52e880c06aafe71b2e007b687aacbf97eb662b8eb2e423e9192f2227909225"
  end
  version "2024.1.5"
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
