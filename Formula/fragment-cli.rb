require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.25-1-darwin-x64.tar.gz"
    sha256 "461f6d65da286cc46e388d3c23280f0a201e4d48146d2fa719d1e09bd51318fc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.25-1-darwin-arm64.tar.gz"
      sha256 "eb122490400243b87a6f2666e4b892dfa8e5ff96681255189f8667d3ef8c5d48"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.25-1-linux-x64.tar.gz"
    sha256 "1d75e5ad08cc43737f901643ce626ec46d6fc20d8bee2a599130540272994ff7"
  end
  version "2023.8.25-1"
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
